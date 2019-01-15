.class public Lloony/com/nativeexample/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field getSign:Landroid/widget/Button;

.field loginField:Landroid/widget/EditText;

.field passwordField:Landroid/widget/EditText;

.field sign:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const-string v0, "native-lib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lloony/com/nativeexample/MainActivity;[I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lloony/com/nativeexample/MainActivity;
    .param p1, "x1"    # [I

    .line 18
    invoke-direct {p0, p1}, Lloony/com/nativeexample/MainActivity;->getHexString([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHexString([I)Ljava/lang/String;
    .locals 7
    .param p1, "array"    # [I

    .line 66
    const-string v0, ""

    .line 68
    .local v0, "hex":Ljava/lang/String;
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p1, v2

    .line 69
    .local v3, "i":I
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    .line 70
    .local v4, "time":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 71
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 73
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 68
    .end local v3    # "i":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    .end local v4    # "time":Ljava/lang/String;
    :cond_1
    return-object v0
.end method


# virtual methods
.method public native magic(Ljava/lang/String;)[I
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 33
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v0, 0x7f09001c

    invoke-virtual {p0, v0}, Lloony/com/nativeexample/MainActivity;->setContentView(I)V

    .line 36
    const v0, 0x7f07004e

    invoke-virtual {p0, v0}, Lloony/com/nativeexample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lloony/com/nativeexample/MainActivity;->loginField:Landroid/widget/EditText;

    .line 37
    const v0, 0x7f07005b

    invoke-virtual {p0, v0}, Lloony/com/nativeexample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lloony/com/nativeexample/MainActivity;->passwordField:Landroid/widget/EditText;

    .line 39
    const v0, 0x7f070077

    invoke-virtual {p0, v0}, Lloony/com/nativeexample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lloony/com/nativeexample/MainActivity;->sign:Landroid/widget/TextView;

    .line 41
    const v0, 0x7f070076

    invoke-virtual {p0, v0}, Lloony/com/nativeexample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lloony/com/nativeexample/MainActivity;->getSign:Landroid/widget/Button;

    .line 43
    iget-object v0, p0, Lloony/com/nativeexample/MainActivity;->getSign:Landroid/widget/Button;

    new-instance v1, Lloony/com/nativeexample/MainActivity$1;

    invoke-direct {v1, p0}, Lloony/com/nativeexample/MainActivity$1;-><init>(Lloony/com/nativeexample/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    return-void
.end method
