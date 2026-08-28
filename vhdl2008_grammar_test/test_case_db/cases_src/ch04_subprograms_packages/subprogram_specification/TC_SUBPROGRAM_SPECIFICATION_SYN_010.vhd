-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: impure function_specification with file access: impure function reads global variables/signals, verifies the impure semantics of the function branch in subprogram_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_impure_ent is port(clk:in bit; cnt:out integer); end entity;
architecture bh of ss_impure_ent is
  signal s_count:integer:=0;
  impure function f_read_count return integer is
  begin return s_count; end function;
begin
  process(clk) begin
    if clk'event and clk='1' then s_count<=s_count+1; end if;
  end process;
  cnt<=f_read_count;
end architecture bh;
