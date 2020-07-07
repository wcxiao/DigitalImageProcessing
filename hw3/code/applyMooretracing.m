%disk_edge.pngÊÇ¶þÖµÍ¼
edge = imread('disk_edge.png');
edge = im2double(edge);
imshow( edge );

%left-down: key
boundary1 = mooreneighbortracing( edge,[228 66] );
hold on;
plot( boundary1( :, 2 ), boundary1( :, 1 ), 'r' );
hold off;

%right-up: rectangle
boundary2 = mooreneighbortracing( edge,[41 240] );
hold on;
plot( boundary2( :, 2 ), boundary2( :, 1 ), 'g' );
hold off;

%left-up: rectangle
boundary3 = mooreneighbortracing( edge,[74 52] );
hold on;
plot( boundary3( :, 2 ), boundary3( :, 1 ), 'b' );
hold off;

boundary4 = mooreneighbortracing( edge,[56 193] );
hold on;
plot( boundary4( :, 2 ), boundary4( :, 1 ),'Color', [0.3 0.6 0.2] );
hold off;

boundary5 = mooreneighbortracing( edge,[151 61] );
hold on;
plot( boundary5( :, 2 ), boundary5( :, 1 ), 'y' );
hold off;

boundary6 = mooreneighbortracing( edge,[229 172] );
hold on;
plot( boundary6( :, 2 ), boundary6( :, 1 ), 'm' );
hold off;

boundary7 = mooreneighbortracing( edge,[203 200] );
hold on;
plot( boundary7( :, 2 ), boundary7( :, 1 ),'Color', [0.1 0.3 0.6] );
hold off;

boundary8 = mooreneighbortracing( edge,[188 213] );
hold on;
plot( boundary8( :, 2 ), boundary8( :, 1 ),'Color', [0.4 0.8 0.3] );
hold off;
