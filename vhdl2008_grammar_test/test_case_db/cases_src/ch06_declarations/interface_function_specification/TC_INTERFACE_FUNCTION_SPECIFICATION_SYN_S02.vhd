-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: Production-specific: interface_function_specification with impure function explicitly specified.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_func_spec_syn_s2 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(7 downto 0);
    parity : out bit
  );
end entity interface_func_spec_syn_s2;

architecture rtl of interface_func_spec_syn_s2 is
  impure function calc_parity(d : bit_vector) return bit is
    variable p : bit := '0';
  begin
    for i in d'range loop
      p := p xor d(i);
    end loop;
    return p;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      parity <= calc_parity(data);
    end if;
  end process;
end architecture rtl;
