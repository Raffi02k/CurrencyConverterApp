package se.iths.java24.eur;

import se.iths.java24.spi.ConverterInfo;
import se.iths.java24.spi.CurrencyConverter;

@ConverterInfo("EUR Converter")
public class EuroConverter implements CurrencyConverter {

    private static final double SEK_TO_USD = 11.50;

    @Override
    public double convert(double amountInSek) {
        return amountInSek / SEK_TO_USD;
    }
}
