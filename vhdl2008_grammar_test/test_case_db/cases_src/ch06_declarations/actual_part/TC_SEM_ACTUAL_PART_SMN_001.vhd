-- =============================================================
-- Case ID: TC_SEM_ACTUAL_PART_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator
--              | function_name ( actual_designator )
--              | type_mark ( actual_designator )
-- Case Type: Negative (Semantic)
-- Test Focus: actual_part — SEMANTIC ERROR: type_mark(actual_designator)
--             with incompatible type conversion. Using integer() conversion
--             on a bit signal is syntactically valid (actual_part form is
--             correct), but semantically wrong because integer is not a
--             type_mark that accepts bit arguments.
-- Expected Result: Triggers semantic/elaboration error (type conversion error)
-- Dependencies: None
-- =============================================================

entity actual_part_smn1 is
  port (
    clk   : in  bit;
    data  : out bit
  );
end entity actual_part_smn1;

architecture arch of actual_part_smn1 is

  component latch_bit is
    port (
      enable : in  bit;
      d_in   : in  bit;
      q_out  : out bit
    );
  end component;

  -- SEMANTIC ERROR: s_flag is bit, but integer(s_flag) attempts
  -- to apply an integer type conversion to a bit value.
  -- Syntax is fine (actual_part = type_mark(actual_designator)),
  -- but integer type_mark does not accept bit as actual_designator.
  signal s_flag  : bit := '0';
  signal s_out   : bit;

begin

  u_latch : component latch_bit
    port map (
      enable => clk,
      d_in   => integer(s_flag),
      q_out  => s_out
    );

  data <= s_out;

end architecture arch;
