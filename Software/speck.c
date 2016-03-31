#include <stdio.h>

#define u64 unsigned long long
//#define u48 unsigned long long
//#define u32 unsigned long
//#define u24 unsigned long
//#define u16 unsigned short
typedef u64 word;

/******************* Choose parameters here ********************/
#define n 24
#define m 4
#define T 23
#define alpha 8
#define beta 3


#define MASK ((0x1<<n)-1)
#define LCS(x,r) ((x<<r)|(x>>(n-r)))&MASK
#define RCS(x,r) ((x>>r)|(x<<(n-r)))&MASK
#define R(x,y,k) (x=RCS(x,alpha), x+=y, x=x&MASK, x^=k, y=LCS(y,beta), y^=x)
#define Rinv(x,y,k) (y=x^y, y=RCS(y,beta), x=x^k, x=x-y, x=x&MASK, x=LCS(x,alpha))
/******************** Key Expansion ***********************/
void expandKey(word K[], word k[]){
  word B, A=K[0];
  word l[T-2+m];
  for(int i=0; i<m-1; i++){
    l[i] = K[i+1];
  }
  k[0]=A;
  for(int i=0; i<T-1; i++){
    B=l[i];
    R(B,A,i);
    k[i+1]=A;
    l[i+m-1]=B;
  }
  printf("Decryption key: ");
  printf("%llx ",k[T-1]);
  for(int i =T+m-3; i>T-2; i--){
    printf("%llx ",l[i]);
  }
  printf("\n");
}

void expandDecKey(word K[], word k[]){
    word B, A=K[0];
    word l[T-2+m];
    for(int i=0; i<m-1; i++){
      l[i]=K[i+1];
    }
    k[0]=A;
    for(int i=0; i<T-1; i++){
      B=l[i];
      Rinv(B,A,T-2-i);
      k[i+1]=A;
      l[i+m-1]=B;
    }
}

/******************** Encryption ***********************/

void encrypt(word pt[], word ct[], word k[]){
  ct[1]=pt[1]; ct[0]=pt[0];
  for(int i=0; i<T; i++){
      R(ct[0],ct[1],k[i]);
  }
}

void decrypt(word ct[], word pt[], word k[]){
  pt[1]=ct[1]; pt[0]=ct[0];
  for(int i=0; i<T; i++){
      Rinv(pt[0],pt[1],k[T-1-i]);
  }
}

/******************** TestBench ***********************/

int main(int argc, char* argv[]){
  // Speck 32/64 -> CT = a868 42f2
  // word pt[2] = {0x6574, 0x694c};
  // word key[m] = {0x0100, 0x0908, 0x1110, 0x1918};
  // Speck 48/72 -> CT = c049a5 385adc
  // word pt[2] = {0x20796c, 0x6c6172};
  // word key[m] = {0x020100, 0x0a0908, 0x121110};
  // Speck 48/96 -> CT = 735e10 b6445d
  word pt[2] = {0x6d2073, 0x696874}; // pt[0] = MSB = x, pt[1] = LSB = y
  word key[m] = {0x020100, 0x0a0908, 0x121110, 0x1a1918};
  word dec_key[m] = {0xcb6915, 0xc6cbb1, 0x4a5369, 0x7f5a9d};


  word ct[2];
  word k[T];
  word k_bar[T];

  expandKey(key,k);
  expandDecKey(dec_key,k_bar);
  for(int i=0; i<T; i++){
    if(k[i]!=k_bar[T-1-i]){
      printf("key mismatch at index %d ! \n",i);
    }
  }

  encrypt(pt,ct,k);
  printf("encrypt: ");
  for(int i=0; i<2; i++){
    printf("%llx ",ct[i]);
  }
  printf("\n");
  word pt2[2];
  decrypt(ct,pt2,k);
  printf("decrypt: ");
  for(int i=0; i<2; i++){
    printf("%llx ",pt2[i]);
  }
  printf("\n");
}
