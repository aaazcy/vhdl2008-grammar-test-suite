-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with variable-class parameters only in formal_parameter_list exercising inout mode and variable interface class for data exchange between procedures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_varonly_ent is
  port(data_in: in bit_vector(7 downto 0); data_out: out bit_vector(7 downto 0));
end entity;
architecture bh of ps_varonly_ent is
  procedure p_swap_words(
    variable a: inout bit_vector(7 downto 0);
    variable b: inout bit_vector(7 downto 0)) is
    variable tmp: bit_vector(7 downto 0);
  begin
    tmp := a;
    a := b;
    b := tmp;
  end procedure;
begin
  process(data_in)
    variable v_lo, v_hi: bit_vector(7 downto 0);
  begin
    v_lo := data_in;
    v_hi := not data_in;
    p_swap_words(v_lo, v_hi);
    data_out <= v_lo xor v_hi;
  end process;
end architecture bh;
