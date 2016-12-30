package PW;
$Mojo::Webqq::Plugin::Pu::PRIORITY = 1;
use pullword;
sub call {
    my $client = shift;
    $client->on(receive_message=>sub{
        my($client,$msg)=@_;
        return if not $msg->allow_plugin;
        return if $msg->content !~ /(pullword|分词)\s+(.*)/;
        my $arg= $2 if $msg->content=~ /(pullword|分词)\s+(.*)/; 
        my $reply= PWget($arg,0,1);
        $reply .="(源于Mojo-Webqq桔子分词机器人插件)";
   $msg->reply($reply,sub{$_[1]->from("bot")}) if $reply;      
    });
}
1;
