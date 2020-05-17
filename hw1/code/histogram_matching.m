% A=imread('c.jpg');
A=imread('a.jpg');
AR=A(:,:,1);
AG=A(:,:,2);
AB=A(:,:,3);

[AM,AN]=size(A(:,:,1));
L=256;

[ARnk,ARrk]=imhist(AR);
ARsk=zeros(1,L);
[AGnk,AGrk]=imhist(AG);
AGsk=zeros(1,L);
[ABnk,ABrk]=imhist(AB);
ABsk=zeros(1,L);

for i=0:1:255
    tempR=0;
    tempG=0;
    tempB=0;
    for j=0:1:i
        tempR=tempR+ARnk(ARrk==j);
        tempG=tempG+AGnk(AGrk==j);
        tempB=tempB+ABnk(ABrk==j);
    end
    ARsk(i+1)=uint8(round((L-1)*tempR/AM/AN));
    AGsk(i+1)=uint8(round((L-1)*tempG/AM/AN));
    ABsk(i+1)=uint8(round((L-1)*tempB/AM/AN));
end

% figure,
% subplot(131),hist(ARsk,255);
% subplot(132),plot(AGsk);
% subplot(133),plot(ABsk);

% ¶ÔA¾ùºâ»¯£º
AR_HE=AR;
AG_HE=AG;
AB_HE=AB;

for i=1:AM
    for j=1:AN
        AR_HE(i,j)=ARsk(AR_HE(i,j)+1);
        AG_HE(i,j)=AGsk(AG_HE(i,j)+1);
        AB_HE(i,j)=ABsk(AB_HE(i,j)+1);
    end
end


% B=imread('d.jpg');
B=imread('b.jpg');
BR=B(:,:,1);
BG=B(:,:,2);
BB=B(:,:,3);

[BM,BN]=size(B(:,:,1));
L=256;

[BRnk,BRrk]=imhist(BR);
BRsk=zeros(1,L);
[BGnk,BGrk]=imhist(BG);
BGsk=zeros(1,L);
[BBnk,BBrk]=imhist(BB);
BBsk=zeros(1,L);

for q=0:1:255
    tempR=0;
    tempG=0;
    tempB=0;
    for j=0:1:q
        tempR=tempR+BRnk(BRrk==j);
        tempG=tempG+BGnk(BGrk==j);
        tempB=tempB+BBnk(BBrk==j);
    end
    BRsk(q+1)=uint8(round((L-1)*tempR/BM/BN));
	BGsk(q+1)=uint8(round((L-1)*tempG/BM/BN));
	BBsk(q+1)=uint8(round((L-1)*tempB/BM/BN));
end

uintBRsk=uint8(BRsk);
uintBGsk=uint8(BGsk);
uintBBsk=uint8(BBsk);

[BRC,BRia,BRic]=unique(uintBRsk);
[BGC,BGia,BGic]=unique(uintBGsk);
[BBC,BBia,BBic]=unique(uintBBsk);

AR_HM=AR_HE;
AG_HM=AG_HE;
AB_HM=AB_HE;

% flag=0;
% 
% BRiaT=transpose(BRia);

for i=1:AM
    for j=1:AN
        rpos=find(BRC==AR_HM(i,j));
        while(isempty(rpos))
            AR_HM(i,j)=AR_HM(i,j)-1;
            rpos=find(BRC==AR_HM(i,j));
            if(AR_HM(i,j)<=0)
                break
            end
        end
        if(AR_HM(i,j)<=0)
            if(isempty(find(BRC==0)))
                AR_HM(i,j)=0;
            else
                AR_HM(i,j)=uint8(BRia(find(BRC==0)))-1;
            end
        else
            AR_HM(i,j)=uint8(BRia(rpos))-1;
        end
        
        gpos=find(BGC==AG_HM(i,j));
        while(isempty(gpos))
            AG_HM(i,j)=AG_HM(i,j)-1;
            gpos=find(BGC==AG_HM(i,j));
            if(AG_HM(i,j)<=0)
                break
            end
        end
        if(AG_HM(i,j)<=0)
            if(isempty(find(BGC==0)))
                AG_HM(i,j)=0;
            else
                AG_HM(i,j)=uint8(BGia(find(BGC==0)))-1;
            end
        else
            AG_HM(i,j)=uint8(BGia(gpos))-1;
        end
        
        bpos=find(BBC==AB_HM(i,j));
        while(isempty(bpos))
            AB_HM(i,j)=AB_HM(i,j)-1;
            bpos=find(BBC==AB_HM(i,j));
            if(AB_HM(i,j)<=0)
                break
            end
        end
        if(AB_HM(i,j)<=0)
            if(isempty(find(BBC==0)))
                AB_HM(i,j)=0;
            else
                AB_HM(i,j)=uint8(BBia(find(BBC==0)))-1;
            end
        else
            AB_HM(i,j)=uint8(BBia(bpos))-1;
        end
    end
end


A_HM(:,:,1)=AR_HM;
A_HM(:,:,2)=AG_HM;
A_HM(:,:,3)=AB_HM;

imshow(A_HM);

