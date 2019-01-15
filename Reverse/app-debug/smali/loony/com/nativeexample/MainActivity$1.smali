.class Lloony/com/nativeexample/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lloony/com/nativeexample/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lloony/com/nativeexample/MainActivity;


# direct methods
.method constructor <init>(Lloony/com/nativeexample/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lloony/com/nativeexample/MainActivity;

    .line 43
    iput-object p1, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 46
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 48
    .local v0, "curJson":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "login"

    iget-object v2, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    iget-object v2, v2, Lloony/com/nativeexample/MainActivity;->loginField:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    const-string v1, "passsword"

    iget-object v2, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    iget-object v2, v2, Lloony/com/nativeexample/MainActivity;->passwordField:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    goto :goto_0

    .line 50
    :catch_0
    move-exception v1

    .line 51
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 53
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    iget-object v1, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lloony/com/nativeexample/MainActivity;->magic(Ljava/lang/String;)[I

    move-result-object v1

    .line 58
    .local v1, "timeValue":[I
    iget-object v2, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    iget-object v2, v2, Lloony/com/nativeexample/MainActivity;->sign:Landroid/widget/TextView;

    iget-object v3, p0, Lloony/com/nativeexample/MainActivity$1;->this$0:Lloony/com/nativeexample/MainActivity;

    invoke-static {v3, v1}, Lloony/com/nativeexample/MainActivity;->access$000(Lloony/com/nativeexample/MainActivity;[I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    return-void
.end method
