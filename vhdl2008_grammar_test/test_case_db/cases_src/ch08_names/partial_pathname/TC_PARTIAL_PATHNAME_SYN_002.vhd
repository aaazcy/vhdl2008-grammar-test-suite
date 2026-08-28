-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Test Focus: partial_pathname with single pathname_element — 'u_dut.reg_out' as one pathname_element followed by object_simple_name; exercises the basic pathname_element.object form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ppn_single_ent is
  port(local_data : in bit_vector(3 downto 0); matched : out bit);
end entity;

architecture vhdl2008 of ppn_single_ent is
  alias dut_reg is <<signal ^.u_dut.reg_out : bit_vector(3 downto 0)>>;
  signal match_reg : bit := '0';
begin
  process(local_data)
  begin
    if local_data = dut_reg then
      match_reg <= '1';
    else
      match_reg <= '0';
    end if;
  end process;
  matched <= match_reg;
end architecture vhdl2008;
