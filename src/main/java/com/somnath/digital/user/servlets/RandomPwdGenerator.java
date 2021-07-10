package com.somnath.digital.user.servlets;

import java.util.Random;

public class RandomPwdGenerator {

	

		public static void main(String[] args) {

		  // System.out.println(generateRandomChars(
		    //        "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"+"0123456789"+"abcdefghijklmnopqrstuvxyz"+"#$%!@*()^", 8));
		   
		}

		/**
		 * 
		 * @param candidateChars
		 *            the candidate chars
		 * @param length
		 *            the number of random chars to be generated
		 * 
		 * @return
		 */
		public  String generateRandomChars(String candidateChars, int length) {
		    StringBuilder sb = new StringBuilder();
		    Random random = new Random();
		    for (int i = 0; i < length; i++) {
		        sb.append(candidateChars.charAt(random.nextInt(candidateChars
		                .length())));
		    }

		    return sb.toString();
		}

	}
	


