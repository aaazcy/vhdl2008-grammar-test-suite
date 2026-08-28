-- =============================================================
-- Case ID: TC_DESIGNATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Case Type: Positive
-- Test Focus: Exercises designator syntax variant 4 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity designator_syn4 is
  port (
    a : in  bit_vector(1 downto 0);
    b : in  bit_vector(1 downto 0);
    y : out bit_vector(2 downto 0)
  );
end entity designator_syn4;

architecture rtl of designator_syn4 is
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
