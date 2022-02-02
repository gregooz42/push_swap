

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gborne <gborne@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/17 17:10:18 by dalves-p          #+#    #+#              #
#    Updated: 2022/01/24 04:50:17 by gborne           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	push_swap
CC			=	gcc
SRCS		=	srcs/main.c \
				srcs/check.c \
				srcs/pile.c \
				srcs/command.c \
				srcs/command_main.c \
				srcs/sort/sort.c \
				srcs/sort/sort_small_stack.c \
				srcs/sort/sort_big_stack.c \
				srcs/sort/sort_bigbig_stack.c \
				srcs/sort/sort_functions.c \

LIBFT		=	libft/libft.a
CFLAGS		=	-Wall -Wextra -Werror
RM			=	rm -f
OBJS		=	$(SRCS:%.c=%.o)


all:		$(NAME)

$(NAME):	$(OBJS)
			make -C libft
			$(CC) $(OBJS) $(LIBFT) $(CFLAGS) -o $(NAME)

%o:			%.c
			$(CC) $(CFLAGS) -Imlx -c $< -o $@

sanitize: 	$(OBJS)
			make -C libft
			$(CC) $(OBJS) $(LIBFT) -g -fsanitize=address $(CFLAGS) -o $(NAME)

clean:
			$(RM) $(OBJS) $(OBJS_BONUS)

fclean:		clean
			$(RM) $(NAME)
			$(RM) *.out
			make fclean -C libft/

re:			fclean all


testdebug:	all
			./push_swap 1 2 3 4 0 6 5 8 $m

test2:		all
			./push_swap 8 5 $m

test3:		all
			./push_swap 8 5 6 $m

test5:		all
			./push_swap 83 32 6 256 125 $m

test6:		all
			./push_swap 83 32 6 256 125 84 $m

test7:		all
			./push_swap 83 32 6 256 125 84 25 $m

test8:		all
			./push_swap 83 32 6 256 125 84 25 1 $m

test10:		all
			./push_swap 83 32 6 256 125 84 25 -30 "5" 0 $m

test20:		all
			./push_swap 9 38 7 47 45 6 0 2 52 10 32 12 13 24 15 16 100 18 19 20 $m

test50:		all
			./push_swap 46 28 22 8 44 23 21 9 14 30 45 26 50 13 2 43 1 24 10 36 33 32 38 25 4 37 3 35 48 31 7 34 6 49 17 29 27 20 18 42 39 12 15 47 41 11 40 16 19 5 $m

test100:	all
			./push_swap 56 50 74 72 25 57 33 6 81 36 16 35 47 58 61 49 100 54 93 41 96 29 22 68 12 62 28 86 78 91 98 77 83 88 24 69 70 20 44 64 94 27 59 14 60 23 21 79 53 17 2 76 43 71 9 15 85 84 48 87 99 19 67 10 73 92 4 11 42 95 75 51 97 39 3 18 34 66 31 5 45 8 7 82 13 37 26 89 40 1 65 32 38 52 90 55 46 63 30 80 $m

test500:	all
			./push_swap 351 342 203 464 70 113 106 392 25 224 411 444 11 98 186 456 69 311 164 428 160 330 364 125 300 230 94 32 183 388 192 357 409 117 168 55 58 445 39 500 346 152 131 21 293 455 403 396 303 177 88 260 304 13 178 217 87 291 119 366 207 184 398 80 100 227 157 59 17 107 138 235 144 193 72 302 307 8 264 467 188 50 363 22 252 83 150 126 53 111 96 245 412 485 419 367 243 407 202 474 290 198 248 257 29 426 121 61 280 430 408 91 495 361 353 443 174 448 132 179 82 269 275 28 99 40 333 460 457 480 18 1 161 9 30 145 263 321 34 148 15 86 20 206 162 37 141 116 282 2 326 284 416 212 470 298 51 296 77 463 211 322 127 478 347 81 404 278 197 494 285 79 468 295 246 425 313 352 415 462 175 163 475 373 308 155 424 52 393 71 331 487 214 472 66 47 272 418 196 374 355 348 420 376 429 340 221 492 118 294 195 268 142 446 48 105 180 267 135 486 484 65 490 24 225 274 42 208 54 229 76 332 84 345 124 493 73 297 169 14 258 172 101 433 233 110 394 410 498 344 62 74 262 310 384 477 185 385 432 259 57 137 271 414 320 140 496 238 343 133 19 199 380 228 222 200 354 315 103 488 170 277 454 31 356 109 452 390 489 151 139 216 368 158 45 93 190 359 318 4 191 147 97 251 306 35 324 253 43 242 378 215 115 479 16 240 371 64 128 329 434 289 136 270 247 171 95 383 226 232 123 439 482 60 406 375 205 244 204 68 237 92 350 5 423 250 146 189 431 413 63 149 405 391 265 316 379 255 26 154 301 370 483 440 465 427 327 389 323 397 129 134 292 273 36 187 299 3 369 46 156 104 281 167 341 194 249 49 399 338 469 401 362 442 236 382 44 159 499 437 466 85 349 453 41 436 182 12 78 10 241 38 288 90 365 337 7 112 336 283 102 461 210 266 421 6 165 89 176 402 441 219 114 471 497 481 372 422 449 435 377 335 417 122 358 231 491 476 220 239 319 387 447 400 153 286 130 213 451 395 261 143 339 166 458 276 287 459 314 450 27 67 234 438 223 218 23 120 317 325 305 328 181 256 309 279 33 108 381 173 201 254 312 209 360 75 56 473 334 386 $m

test1000:	all
			./push_swap 380 343 209 884 710 331 417 18 157 935 45 766 15 503 225 565 500 650 429 17 409 244 183 751 987 932 735 14 282 118 358 483 378 662 688 285 984 274 603 241 931 596 525 573 323 534 770 934 975 983 67 466 21 624 873 197 547 538 930 253 84 985 153 552 866 397 912 396 440 800 223 458 131 586 142 972 50 787 287 121 539 672 771 139 889 62 619 982 395 511 876 847 432 951 258 317 330 307 589 293 386 47 753 337 80 968 472 126 379 557 218 347 507 615 700 168 540 43 600 769 44 286 90 98 119 159 785 175 416 385 576 680 476 279 110 11 779 809 675 611 214 692 551 198 875 865 656 99 612 655 130 514 85 914 423 186 505 963 898 470 592 381 185 204 883 528 252 855 793 140 109 686 950 813 410 249 887 774 79 585 262 281 322 777 618 798 760 236 179 415 101 607 154 87 405 351 294 462 478 122 850 320 450 117 588 808 83 316 441 907 864 301 740 648 529 937 955 946 911 325 150 102 404 365 610 994 999 938 792 587 531 419 881 676 580 990 401 108 481 327 111 1 305 544 722 683 137 448 521 917 796 356 364 234 617 387 269 744 575 143 276 100 716 333 491 311 921 733 638 729 163 485 577 837 673 194 843 71 685 895 363 970 289 598 22 727 444 398 651 124 568 174 725 706 479 152 453 468 584 25 406 167 499 926 147 443 978 563 464 188 216 33 144 431 839 160 421 248 705 133 762 974 138 366 388 743 227 583 581 377 919 877 200 3 803 235 830 558 665 810 582 947 228 791 613 217 264 989 31 776 489 89 605 614 788 626 721 708 132 923 42 418 765 894 825 391 184 498 623 319 314 942 882 211 399 229 342 240 9 545 393 819 786 679 880 292 696 445 627 78 255 971 275 161 220 720 541 201 653 927 806 146 436 643 797 998 640 192 471 746 346 522 492 868 961 897 513 782 997 12 384 658 920 599 878 768 13 561 145 939 635 222 261 811 469 180 559 51 166 208 542 53 54 591 836 896 352 616 574 644 622 250 257 426 886 383 899 116 608 20 81 566 328 820 530 749 697 414 862 394 475 519 341 447 745 645 621 376 669 428 888 979 34 916 82 857 693 467 913 527 488 747 357 812 647 284 941 991 247 496 829 570 91 302 497 256 169 413 265 473 484 259 848 480 338 134 590 664 66 516 699 844 92 953 903 104 368 195 667 297 170 226 702 162 807 16 96 535 944 959 976 870 298 784 112 156 308 594 701 668 141 465 860 390 336 567 75 501 268 2 459 324 490 933 176 816 280 767 772 4 361 106 569 631 654 510 438 219 271 995 652 609 967 173 734 741 945 135 32 641 756 659 867 604 965 869 334 59 731 73 754 318 452 759 64 817 482 125 277 691 893 678 854 802 389 925 260 127 964 833 266 801 572 905 977 93 120 826 41 728 571 620 10 601 637 272 435 778 509 986 973 593 824 712 960 901 949 136 885 94 267 278 113 88 487 288 494 230 422 455 597 831 354 36 233 755 515 454 182 709 872 181 795 851 382 237 57 846 58 46 155 97 536 992 956 834 149 69 954 804 681 952 65 891 625 310 555 682 35 579 677 202 128 213 38 993 763 750 392 508 215 370 196 425 639 348 1000 40 602 633 27 190 449 424 852 251 5 439 172 671 68 238 537 799 373 344 374 818 313 533 203 403 853 212 646 842 437 103 560 957 714 543 283 780 129 77 433 304 420 105 114 827 554 23 486 980 72 242 962 634 856 704 524 915 689 70 191 548 715 924 859 532 350 263 845 936 299 737 207 764 329 457 199 890 752 221 684 290 649 636 815 232 904 345 996 76 502 981 739 835 940 37 726 8 757 339 412 30 273 171 822 690 909 910 165 303 908 26 832 369 550 400 19 670 805 408 86 556 349 48 789 783 372 402 332 7 629 775 164 504 340 562 849 958 306 451 929 871 224 879 360 523 657 178 717 546 736 526 326 359 606 758 969 29 210 553 430 495 660 520 790 123 28 966 948 355 928 713 309 158 148 206 107 474 874 353 630 703 828 564 698 861 863 719 512 312 773 695 245 742 177 723 506 442 988 549 446 300 254 315 707 193 411 632 674 823 243 205 943 718 518 375 231 49 52 595 74 367 663 362 55 694 902 270 61 39 461 738 711 60 517 463 821 906 858 407 781 838 321 295 189 115 761 687 732 724 434 840 748 427 841 918 794 371 187 892 578 239 642 477 493 151 900 56 246 95 335 24 628 922 661 6 456 814 63 291 296 666 730 460 $m

git:
	@git add *
	@git commit -m "$m"
	@git push
	@echo "Commit sent to github"
# Para chamar: make git m="meu commit"

.PHONY:		all clean fclean re test sanitize
