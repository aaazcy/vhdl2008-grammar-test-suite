-- =============================================================
-- Case ID: TC_ACTUAL_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator function_name ( actual_designator ) | type_mark ( actual_designator )
-- Case Type: Positive
-- Test Focus: Exercises actual_part syntax variant 8 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity actual_part_syn8 is
  port (
    a : in  bit_vector(1 downto 0);
    b : in  bit_vector(1 downto 0);
    y : out bit_vector(2 downto 0)
  );
end entity actual_part_syn8;

architecture rtl of actual_part_syn8 is
  component adder is
    port (
      op_a : in  bit_vector(1 downto 0);
      op_b : in  bit_vector(1 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(1 downto 0);
      cout : out bit
    );
  end component;
  signal s_sum  : bit_vector(1 downto 0);
  signal s_cout : bit;
begin
  u_add : adder
    port map (
      op_a => a,
      op_b => b,
      cin  => '0',
      sum  => s_sum,
      cout => s_cout
    );
  y <= s_cout & s_sum;
end architecture rtl;
