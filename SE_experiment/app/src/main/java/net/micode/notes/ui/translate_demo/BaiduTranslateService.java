package net.micode.notes.ui.translate_demo;

import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;
public interface BaiduTranslateService {
    //翻译接口
    //表示提交表单数据，@Field注解键名
    //适用于数据量少的情况
    @POST("translate")
    @FormUrlEncoded
    Call<RespondBean> translate(@Field("q") String q, @Field("from") String from, @Field("to") String to, @Field("appid") String appid, @Field("salt") String salt,
                                @Field("sign") String sign);
}
