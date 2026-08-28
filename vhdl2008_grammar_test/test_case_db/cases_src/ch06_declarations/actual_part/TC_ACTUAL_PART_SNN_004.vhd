-- =============================================================
-- Case ID: TC_ACTUAL_PART_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator
--              | function_name ( actual_designator )
--              | type_mark ( actual_designator )
-- Case Type: Negative
-- Test Focus: actual_part — ERROR: using a keyword 'open' directly inside
--             the type_mark() form. While 'open' is a valid actual_designator
--             alternative, type_mark(open) is semantically nonsensical
--             because you cannot convert 'open'. This tests that the
--             parser rejects nonsensical type_mark(open) constructions.
-- Expected Result: Triggers syntax or semantic error
-- Dependencies: None
-- =============================================================

entity actual_part_snn4 is
  port (
    clk   : in  bit;
    data  : out bit
  );
end entity actual_part_snn4;

architecture arch of actual_part_snn4 is

  component d_flipflop is
    port (
      clock : in  bit;
      d     : in  bit;
      q     : out bit
    );
  end component;

  signal s_bit : bit := '0';

begin

  -- ERROR: 'open' as argument to type_mark conversion is invalid.
  -- The BNF for actual_part allows type_mark(actual_designator),
  -- but 'open' means no connection. A type conversion on 'open'
  -- is meaningless — bit(open) is not a valid actual_part.
  u_ff : component d_flipflop
    port map (
      clock => clk,
      d     => bit(open),
      q     => data
    );

end architecture arch;
