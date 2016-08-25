#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* Arrange the N elements of ARRAY in random order.
   Only effective if N is much smaller than RAND_MAX;
   if this may not be the case, use a better random
   number generator. */
void shuffle(int *array, size_t n) {
  if (n > 1) {
    size_t i;
    for (i = 0; i < n - 1; i++) {
      size_t j = i + rand() / (RAND_MAX / (n - i) + 1);
      int t = array[j];
      array[j] = array[i];
      array[i] = t;
    }
  }
}

int goats[] = { -1, -1 };

int simulate(int change) {
  int prize = rand() % 3;
  int selected_door = rand() % 3;
  int i = 0;
  int total_goats = 0;

  for (i=0; i<3; i++) {
    if (i == prize) {
    } else {
      goats[total_goats] = i;
      total_goats += 1;
    }
  }

  //shuffle(goats, sizeof(goats[0]));

  if (change) {
    int new_door = -1;

    while(1) {
      new_door = (rand() % 3);
      if (new_door != goats[0]) {
        break;
      }
    }

    selected_door = new_door;
  }

  if (prize == selected_door) {
    return 1;
  } else {
    return 0;
  }
}

int main(int argc, char **argv) {
  srand(time(NULL));

  int games = 1;
  int stick = 0;

  stick = atoi(argv[1]);
  games = atoi(argv[2]);

  float percent = 0.0;

  float win = 0;

  int g = -1;
  for (g = 0; g<games; g++) {
    win += simulate(stick);
  }

  percent = ((float)win / (float)games) * 100.0;

  printf("%f\n", percent);

  return 0;
}
