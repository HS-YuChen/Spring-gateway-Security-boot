package com.yuchen.source;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.FlinkDemo;
import com.yuchen.bean.MqttBean;
import com.yuchen.demo.MqttServer;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.source.RichParallelSourceFunction;

public class MqttSource extends RichParallelSourceFunction<MqttBean> {
    private MqttServer mqttServer;
    private static final long serialVersionUID = -1290697196832864300L;

    @Override
    public void open(Configuration parameters) throws Exception {
        mqttServer = new MqttServer();
        mqttServer.connect();
    }

    @Override
    public void run(SourceContext<MqttBean> sourceContext) throws Exception {
        mqttServer.sub("yuchenTopic");

        while (true){
            MqttBean mqttBean = new MqttBean();
            mqttBean.setMessage(FlinkDemo.queue.take());
            long timestamp = System.currentTimeMillis();
            mqttBean.setTs(String.valueOf(timestamp));
            mqttBean.setAmount(Math.random() * 100);
            sourceContext.collect(mqttBean);
        }
    }

    @Override
    public void cancel() {

    }

    @Override
    public void close() throws Exception {
        super.close();
        mqttServer.disConnect();
    }
}
