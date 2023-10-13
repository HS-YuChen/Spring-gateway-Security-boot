package com.yuchen;

import com.yuchen.bean.MqttBean;
import com.yuchen.source.MqttSource;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.Table;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.table.catalog.hive.HiveCatalog;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class FlinkDemo {
    public static BlockingQueue<String> queue = new ArrayBlockingQueue<String>(10);


    public static void main(String[] args) throws Exception {
        //从MqTT拿消息（流数据）
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        env.enableCheckpointing(10000);
        DataStream<MqttBean> mqttDataStream = env.addSource(new MqttSource());
        mqttDataStream.print();

        StreamTableEnvironment tableEnv = StreamTableEnvironment.create(env);
        tableEnv.getConfig().getConfiguration().setString("execution.checkpointing.interval", "10000");
        //连接hive 用HiveCatalog替换Flink Table的内部Catalog
        String name = "hive";
        String defaultDatabase = "import_yuchen";
        String hiveConfDir = "/etc/hive/conf.cloudera.hive/";

        HiveCatalog hiveCatalog = new HiveCatalog(name, defaultDatabase, hiveConfDir);
        //注册HiveCatalog
        tableEnv.registerCatalog("hiveCatalog",hiveCatalog);
        //使用HiveCatalog
        tableEnv.useCatalog("hiveCatalog");
        tableEnv.useDatabase("import_yuchen");
        Table table = tableEnv.fromDataStream(mqttDataStream);
        table.printSchema();
        tableEnv.createTemporaryView("temT",table);
        String sql = "INSERT INTO hive_table \n" +
                "SELECT message, amount, DATE_FORMAT(ts, 'yyyy-MM-dd'), DATE_FORMAT(ts, 'HH')\n" +
                "FROM temT";
        tableEnv.executeSql(sql);
        env.execute("insertHive Job");
    }
}
