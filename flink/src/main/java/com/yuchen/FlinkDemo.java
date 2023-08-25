package com.yuchen;

import com.yuchen.source.MqttSource;
import org.apache.flink.api.common.RuntimeExecutionMode;
import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.runtime.executiongraph.Execution;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.SqlDialect;
import org.apache.flink.table.api.Table;
import org.apache.flink.table.api.TableEnvironment;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.table.catalog.hive.HiveCatalog;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class FlinkDemo {
    public static BlockingQueue<String> queue = new ArrayBlockingQueue<String>(10);


    public static void main(String[] args) throws Exception {
        String catalogName     = "myhive";
        String defaultDatabase = "default";
        String hiveConfDir     = "/etc/hive/conf.cloudera.hive/";
        String version         = "1.2.1";
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        env.setRuntimeMode(RuntimeExecutionMode.BATCH);
        StreamTableEnvironment tEnv = StreamTableEnvironment.create(env);

        //写入hive
        HiveCatalog hive = new HiveCatalog(catalogName, defaultDatabase, hiveConfDir, version);
        tEnv.registerCatalog("myHive",hive);
        tEnv.useCatalog("myHive");
        tEnv.getConfig().setSqlDialect(SqlDialect.HIVE);
        tEnv.useDatabase("yuchen");

        DataStreamSource<String> ds = env.addSource(new MqttSource());
        ds.print();
        Table table = tEnv.fromDataStream(ds);
        table.printSchema();
        table.executeInsert("insert overwrite dt_dwd.dwd_test select a from mytable");

        env.execute("yuchen-flink-stream-test");
    }
}
