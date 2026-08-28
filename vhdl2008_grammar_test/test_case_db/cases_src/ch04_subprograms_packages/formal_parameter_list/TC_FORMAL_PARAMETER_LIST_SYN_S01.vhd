-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2
-- Test Focus: Formal parameter list: interface_declaration {; interface_declaration} with legal modes (in/out/inout) and classes (constant/signal/variable)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_formal_parameter_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_formal_parameter_list_syn_s01 is
  procedure p_fpl(constant c_p:in integer; signal s_p:out bit;
    variable v_p:inout integer; signal b_p:out bit) is
  begin s_p<='1'; v_p:=c_p*2; b_p<='0'; end procedure;
  signal s_bit:bit:='0'; signal s_buf:bit; signal s_int:integer:=0;
begin
  process
    variable v_int:integer:=5;
  begin
    p_fpl(c_p=>5, s_p=>s_bit, v_p=>v_int, b_p=>s_buf);
    s_int<=v_int;
    wait;
  end process;
  r<=s_int;
end architecture bh;
