-- =============================================================
-- Case ID: TC_FORMAL_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator function_name ( formal_designator ) | type_mark ( formal_designator )
-- Case Type: Positive
-- Test Focus: Exercises formal_part syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity formal_part_syn7 is
  port (
    a : in  bit_vector(4 downto 0);
    b : in  bit_vector(4 downto 0);
    y : out bit_vector(5 downto 0)
  );
end entity formal_part_syn7;

architecture rtl of formal_part_syn7 is
  component adder is
    port (
      op_a : in  bit_vector(4 downto 0);
      op_b : in  bit_vector(4 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(4 downto 0);
      cout : out bit
    );
  end component;
  signal s_sum  : bit_vector(4 downto 0);
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
