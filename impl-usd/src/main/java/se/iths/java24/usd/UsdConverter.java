package se.iths.java24.usd;

import se.iths.java24.spi.ConverterInfo;
import se.iths.java24.spi.CurrencyConverter;

@ConverterInfo("USD Converter")
public class UsdConverter implements CurrencyConverter {

    private static final double SEK_TO_USD = 10.50;

    @Override
    public double convert(double amountInSek) {
        return amountInSek / SEK_TO_USD;
    }
}
