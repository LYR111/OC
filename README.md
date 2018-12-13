#import <Foundation/Foundation.h>

@interface Clip :NSObject
{
@public
int _bullet;
}
-(void)addBullet;
@end

@implementation Clip
-(void)addBullet
{
_bullet=10;
}
@end

@interface Gun :NSObject
{
Clip *clip;
}
-(void)shoot:(Clip *)c;
@end
@implementation Gun

-(void)shoot:(Clip *)c
{

}
@end

@interface  Soilder :NSObject
{
@public
NSString *_name;
double _height;
double _weight;

}
-(void)fire :(Gun *)g :(Clip *)clip;
@end
@implementation Soilder
-(void)fire :(Gun *)g :(Clip *)clip
{
[g shoot:clip];
}
@end




int main(int argc, const char * argv[]) {
@autoreleasepool {
Soilder *sp=[Soilder new];
Gun *gp=[Gun new];
Clip *clip =[Clip new];
[clip addBullet];
[sp fire:gp :clip];
}
return 0;
}




