/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JRCaptureObject+Internal.h"
#import "JROinonipL2Object.h"

@interface JROinonipL3Object (OinonipL3ObjectInternalMethods)
+ (id)oinonipL3ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath;
- (BOOL)isEqualToOinonipL3Object:(JROinonipL3Object *)otherOinonipL3Object;
@end

@interface JROinonipL2Object ()
@property BOOL canBeUpdatedOrReplaced;
@end

@implementation JROinonipL2Object
{
    NSString *_string1;
    NSString *_string2;
    JROinonipL3Object *_oinonipL3Object;
}
@synthesize canBeUpdatedOrReplaced;

- (NSString *)string1
{
    return _string1;
}

- (void)setString1:(NSString *)newString1
{
    [self.dirtyPropertySet addObject:@"string1"];

    [_string1 autorelease];
    _string1 = [newString1 copy];
}

- (NSString *)string2
{
    return _string2;
}

- (void)setString2:(NSString *)newString2
{
    [self.dirtyPropertySet addObject:@"string2"];

    [_string2 autorelease];
    _string2 = [newString2 copy];
}

- (JROinonipL3Object *)oinonipL3Object
{
    return _oinonipL3Object;
}

- (void)setOinonipL3Object:(JROinonipL3Object *)newOinonipL3Object
{
    [self.dirtyPropertySet addObject:@"oinonipL3Object"];

    [_oinonipL3Object autorelease];
    _oinonipL3Object = [newOinonipL3Object retain];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath      = @"";
        self.canBeUpdatedOrReplaced = NO;

        _oinonipL3Object = [[JROinonipL3Object alloc] init];

        [self.dirtyPropertySet setSet:[NSMutableSet setWithObjects:@"string1", @"string2", @"oinonipL3Object", nil]];
    }
    return self;
}

+ (id)oinonipL2Object
{
    return [[[JROinonipL2Object alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JROinonipL2Object *oinonipL2ObjectCopy = (JROinonipL2Object *)[super copyWithZone:zone];

    oinonipL2ObjectCopy.string1 = self.string1;
    oinonipL2ObjectCopy.string2 = self.string2;
    oinonipL2ObjectCopy.oinonipL3Object = self.oinonipL3Object;

    return oinonipL2ObjectCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null])
             forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null])
             forKey:@"string2"];
    [dict setObject:(self.oinonipL3Object ? [self.oinonipL3Object toDictionary] : [NSNull null])
             forKey:@"oinonipL3Object"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (id)oinonipL2ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    if (!dictionary)
        return nil;

    JROinonipL2Object *oinonipL2Object = [JROinonipL2Object oinonipL2Object];

    oinonipL2Object.captureObjectPath = [NSString stringWithFormat:@"%@/%@", capturePath, @"oinonipL2Object"];
// TODO: Is this safe to assume?
    oinonipL2Object.canBeUpdatedOrReplaced = YES;

    oinonipL2Object.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    oinonipL2Object.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    oinonipL2Object.oinonipL3Object =
        [dictionary objectForKey:@"oinonipL3Object"] != [NSNull null] ? 
        [JROinonipL3Object oinonipL3ObjectObjectFromDictionary:[dictionary objectForKey:@"oinonipL3Object"] withPath:oinonipL2Object.captureObjectPath] : nil;

    [oinonipL2Object.dirtyPropertySet removeAllObjects];
    
    return oinonipL2Object;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@", capturePath, @"oinonipL2Object"];

    if ([dictionary objectForKey:@"string1"])
        self.string1 = [dictionary objectForKey:@"string1"] != [NSNull null] ? 
            [dictionary objectForKey:@"string1"] : nil;

    if ([dictionary objectForKey:@"string2"])
        self.string2 = [dictionary objectForKey:@"string2"] != [NSNull null] ? 
            [dictionary objectForKey:@"string2"] : nil;

    if ([dictionary objectForKey:@"oinonipL3Object"] == [NSNull null])
        self.oinonipL3Object = nil;
    else if ([dictionary objectForKey:@"oinonipL3Object"] && !self.oinonipL3Object)
        self.oinonipL3Object = [JROinonipL3Object oinonipL3ObjectObjectFromDictionary:[dictionary objectForKey:@"oinonipL3Object"] withPath:self.captureObjectPath];
    else if ([dictionary objectForKey:@"oinonipL3Object"])
        [self.oinonipL3Object updateFromDictionary:[dictionary objectForKey:@"oinonipL3Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@", capturePath, @"oinonipL2Object"];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    if (![dictionary objectForKey:@"oinonipL3Object"] || [dictionary objectForKey:@"oinonipL3Object"] == [NSNull null])
        self.oinonipL3Object = nil;
    else if (!self.oinonipL3Object)
        self.oinonipL3Object = [JROinonipL3Object oinonipL3ObjectObjectFromDictionary:[dictionary objectForKey:@"oinonipL3Object"] withPath:self.captureObjectPath];
    else
        [self.oinonipL3Object replaceFromDictionary:[dictionary objectForKey:@"oinonipL3Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if ([self.dirtyPropertySet containsObject:@"oinonipL3Object"])
        [dict setObject:(self.oinonipL3Object ?
                              [self.oinonipL3Object toReplaceDictionaryIncludingArrays:NO] :
                              [[JROinonipL3Object oinonipL3Object] toReplaceDictionaryIncludingArrays:NO]) /* Use the default constructor to create an empty object */
                 forKey:@"oinonipL3Object"];
    else if ([self.oinonipL3Object needsUpdate])
        [dict setObject:[self.oinonipL3Object toUpdateDictionary]
                 forKey:@"oinonipL3Object"];

    return dict;
}

- (NSDictionary *)toReplaceDictionaryIncludingArrays:(BOOL)includingArrays
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    [dict setObject:(self.oinonipL3Object ?
                          [self.oinonipL3Object toReplaceDictionaryIncludingArrays:YES] :
                          [[JROinonipL3Object oinonipL3Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
             forKey:@"oinonipL3Object"];

    return dict;
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if([self.oinonipL3Object needsUpdate])
        return YES;

    return NO;
}

- (BOOL)isEqualToOinonipL2Object:(JROinonipL2Object *)otherOinonipL2Object
{
    if (!self.string1 && !otherOinonipL2Object.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherOinonipL2Object.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherOinonipL2Object.string1]) return NO;

    if (!self.string2 && !otherOinonipL2Object.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherOinonipL2Object.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherOinonipL2Object.string2]) return NO;

    if (!self.oinonipL3Object && !otherOinonipL2Object.oinonipL3Object) /* Keep going... */;
    else if (!self.oinonipL3Object && [otherOinonipL2Object.oinonipL3Object isEqualToOinonipL3Object:[JROinonipL3Object oinonipL3Object]]) /* Keep going... */;
    else if (!otherOinonipL2Object.oinonipL3Object && [self.oinonipL3Object isEqualToOinonipL3Object:[JROinonipL3Object oinonipL3Object]]) /* Keep going... */;
    else if (![self.oinonipL3Object isEqualToOinonipL3Object:otherOinonipL2Object.oinonipL3Object]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:@"NSString" forKey:@"string1"];
    [dict setObject:@"NSString" forKey:@"string2"];
    [dict setObject:@"JROinonipL3Object" forKey:@"oinonipL3Object"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)dealloc
{
    [_string1 release];
    [_string2 release];
    [_oinonipL3Object release];

    [super dealloc];
}
@end
