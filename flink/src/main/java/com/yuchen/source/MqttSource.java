package com.yuchen.source;/*
    @author yuchen
    @create -- 
*/

import com.yuchen.FlinkDemo;
import com.yuchen.demo.MqttServer;
import org.apache.flink.streaming.api.functions.source.RichParallelSourceFunction;

public class MqttSource extends RichParallelSourceFunction<String> {

    private static final long serialVersionUID = -1290697196832864300L;

    @Override
    public void run(SourceContext<String> sourceContext) throws Exception {
        MqttServer mqttServer = new MqttServer();
        mqttServer.connect();
        mqttServer.sub("yuchenTopic");

        while (true){
            sourceContext.collect(FlinkDemo.queue.take());
        }
    }

    @Override
    public void cancel() {

    }
}
