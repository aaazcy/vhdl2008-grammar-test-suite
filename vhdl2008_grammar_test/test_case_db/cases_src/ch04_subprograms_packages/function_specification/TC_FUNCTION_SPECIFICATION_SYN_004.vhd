-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: impure function with explicit [parameter] keyword and constant-class parameter: impure function f_monitor parameter(constant cnt:in integer) return boolean (function parameters must be constant class), verification of the 2008 parameter keyword syntax slot
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fs_paramkw_ent is port(clk:in bit; alert:out boolean); end entity;
architecture bh of fs_paramkw_ent is
  impure function f_monitor parameter(constant cnt:in integer) return boolean is
  begin return cnt>100; end function;
  signal s_count:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_count<=s_count+1; end if;
  end process;
  alert<=f_monitor(s_count);
end architecture bh;
