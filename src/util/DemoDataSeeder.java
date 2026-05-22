package util;

import dao.AccountDAO;
import java.util.Random;
import model.Account;
import service.BankService;

public class DemoDataSeeder {

    private static final String[] BASE_NAMES = {
        "Aarav", "Aisha", "Arjun", "Diya", "Ishaan", "Kavya", "Krishna", "Meera",
        "Neha", "Nikhil", "Pooja", "Rohan", "Saanvi", "Siddharth", "Sneha", "Tanvi",
        "Varun", "Vihaan", "Yash", "Zara"
    };

    private static final String[] WORD_SUFFIX = {
        "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"
    };

    public static void main(String[] args) {
        int count = 60;
        int startAccNo = 2001;

        if (args.length > 0) {
            try {
                count = Integer.parseInt(args[0]);
            } catch (NumberFormatException ignored) {
            }
        }

        if (args.length > 1) {
            try {
                startAccNo = Integer.parseInt(args[1]);
            } catch (NumberFormatException ignored) {
            }
        }

        int inserted = 0;
        int skipped = 0;
        int failed = 0;

        Random random = new Random(20260427L);

        for (int i = 0; i < count; i++) {
            int accNo = startAccNo + i;
            String name = buildName(i);
            double openingBalance = 1500 + random.nextInt(8500);

            try {
                if (AccountDAO.exists(accNo)) {
                    skipped++;
                    continue;
                }

                Account account = BankService.createAccount(accNo, name, openingBalance);

                int txRounds = 1 + random.nextInt(3);
                for (int t = 0; t < txRounds; t++) {
                    boolean doDeposit = random.nextBoolean();
                    if (doDeposit) {
                        double amount = 200 + random.nextInt(2500);
                        account = BankService.deposit(accNo, amount);
                    } else {
                        double maxWithdraw = Math.max(100, account.getBalance() * 0.35);
                        double amount = 100 + random.nextInt((int) Math.max(150, maxWithdraw));
                        if (account.getBalance() > amount) {
                            account = BankService.withdraw(accNo, amount);
                        }
                    }
                }

                inserted++;
            } catch (Exception ex) {
                failed++;
                System.out.println("Failed account " + accNo + ": " + ex.getMessage());
            }
        }

        System.out.println("Demo data seeding complete.");
        System.out.println("Inserted: " + inserted);
        System.out.println("Skipped (already existed): " + skipped);
        System.out.println("Failed: " + failed);
        System.out.println("Tip: Run with custom count/start: java -cp \"src;lib/*\" util.DemoDataSeeder 120 3001");
    }

    private static String buildName(int index) {
        String first = BASE_NAMES[index % BASE_NAMES.length];
        String suffix = WORD_SUFFIX[(index / BASE_NAMES.length) % WORD_SUFFIX.length];
        return first + " Demo " + suffix;
    }
}