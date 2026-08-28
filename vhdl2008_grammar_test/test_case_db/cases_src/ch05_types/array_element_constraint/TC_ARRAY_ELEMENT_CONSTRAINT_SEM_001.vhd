-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: Semantic correctness: array_element_constraint on
--            integer range element in a DSP FIR tap delay line.
--            Each tap stores a valid constrained sample.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fir_tap_delay_line is
  port (
    clk      : in  bit;
    xn       : in  integer range -128 to 127;
    yn       : out integer range -32768 to 32767
  );
end entity fir_tap_delay_line;

architecture rtl of fir_tap_delay_line is
  constant NUM_TAPS : integer := 8;
  subtype tap_sample is integer range -128 to 127;
  type delay_line is array (0 to NUM_TAPS - 1) of tap_sample;
  constant coeff : delay_line := (0=>2, 1=>3, 2=>1, 3=>-1, 4=>2, 5=>0, 6=>1, 7=>1);
  signal taps : delay_line := (others => 0);
begin
  process(clk)
    variable accum : integer range -32768 to 32767 := 0;
  begin
    if clk'event and clk = '1' then
      taps(0) <= xn;
      for i in 1 to NUM_TAPS - 1 loop
        taps(i) <= taps(i - 1);
      end loop;
      accum := 0;
      for i in 0 to NUM_TAPS - 1 loop
        accum := accum + taps(i) * coeff(i);
      end loop;
      yn <= accum;
    end if;
  end process;
end architecture rtl;
