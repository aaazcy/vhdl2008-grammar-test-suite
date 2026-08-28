-- =============================================================
-- Case ID: TC_MODE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.2
-- Test Focus: Mode: in ｜ out ｜ inout ｜ buffer ｜ linkage — all 5 port/parameter mode keywords
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_mode_syn_s01 is port(r:out integer; buf:buffer integer; lnk:linkage integer); end entity;
architecture bh of tc_mode_syn_s01 is
  procedure p_mode(signal i:in integer; signal o:out integer;
    signal io:inout integer; signal b:inout integer) is
  begin o<=i; io<=io+i; b<=i; end procedure;
  signal s_i,s_o,s_io,s_b:integer:=0;
begin
  p_mode(s_i,s_o,s_io,s_b); r<=s_o; buf<=s_o;end architecture bh;
