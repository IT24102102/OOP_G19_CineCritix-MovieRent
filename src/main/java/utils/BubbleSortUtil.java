// DSA part.. implemtning Bubble sort for review clz
package utils;

import models.Review;
import java.util.List;

public class BubbleSortUtil {

    public static void sortReviewsByRating(List<Review> reviews) {
        int n = reviews.size();
        boolean swapped;

        for (int i = 0; i < n - 1; i++) {
            swapped = false;

            for (int j = 0; j < n - i - 1; j++) {
                if (reviews.get(j).getRating() < reviews.get(j + 1).getRating()) {
                    // Swap the reviews
                    Review temp = reviews.get(j);
                    reviews.set(j, reviews.get(j + 1));
                    reviews.set(j + 1, temp);
                    swapped = true;
                }
            }

            if (!swapped) {
                break;
            }
        }
    }
}
