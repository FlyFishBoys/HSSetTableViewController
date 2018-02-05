//
//Student.m 
//
//
//Create by AutoModelFileManager on 18/1/31 
//Copyright (c) 2018年 AutoModelFileManager. All rights reserved.
//
//此文件由有代码自动生成，不要手动修改

#import "Student.h" 

@implementation Student

-(instancetype)init{
	self = [super init];
	if(self){

	}
	return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	if(self){
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.age = [aDecoder decodeObjectForKey:@"age"];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_name forKey:@"name"];
	[aCoder encodeObject:_age forKey:@"age"];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key 
{ 

}

-(NSString *)description{
	return [NSString stringWithFormat:@"{name:%@,age:%@}",_name,_age];
}

@end