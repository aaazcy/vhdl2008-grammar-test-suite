-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with multiple mode combinations: in/out/inout three legal modes used on signal-class parameters (buffer/linkage not applicable to subprogram parameters)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_modes_ent is port(clk:in bit; a:in integer; b:out integer; c:inout integer; d:buffer integer); end entity;
architecture bh of fpl_modes_ent is
  procedure p_modes(
    signal x:in integer;
    signal y:out integer;
    signal z:inout integer;
    signal w:inout integer) is
  begin
    y<=x;
    z<=z+1;
    w<=x*2;
  end procedure;
begin
  process(clk) begin
    if clk'event and clk='1' then p_modes(a,b,c,d); end if;
  end process;
end architecture bh;
