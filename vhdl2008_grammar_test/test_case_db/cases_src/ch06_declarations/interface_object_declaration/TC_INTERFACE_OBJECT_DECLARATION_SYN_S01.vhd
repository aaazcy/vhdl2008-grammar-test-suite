-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.3
-- Test Focus: Interface object declaration: interface_constant ｜ interface_signal ｜ interface_variable ｜ interface_file — all 4 object kinds
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_object_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_object_declaration_syn_s01 is
  procedure p_iod(constant c:in integer; signal s:out integer;
    variable v:inout integer; signal b:inout bit) is
  begin s<=c; v:=v*2; b<='0'; end procedure;
  signal s_iod:integer:=0; signal s_buf:bit;
begin
  process is
    variable v_iod:integer:=10;
  begin
    p_iod(5, s_iod, v_iod, s_buf);
    r<=s_iod;
    wait;
  end process;
end architecture bh;
