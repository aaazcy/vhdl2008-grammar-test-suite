-- =============================================================
-- Case ID: TC_INTERFACE_VARIABLE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.3
-- Test Focus: Interface variable declaration: [variable] identifier {,identifier} : [mode] subtype_indication [:= static_expression]
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_variable_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_variable_declaration_syn_s01 is
  procedure p_ivd(variable v:inout integer) is begin v:=v+1; end procedure;
  signal s_ivd:integer:=0;
begin
  process is
    variable v_ivd:integer:=0;
  begin
    p_ivd(v_ivd);
    r<=v_ivd;
    wait;
  end process;
end architecture bh;
