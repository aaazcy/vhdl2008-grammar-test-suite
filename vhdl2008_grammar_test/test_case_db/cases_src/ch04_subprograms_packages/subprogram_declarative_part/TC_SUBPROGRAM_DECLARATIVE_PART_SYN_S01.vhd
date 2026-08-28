-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram declarative part: zero or more subprogram_declarative_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_declarative_part_syn_s01 is
  function f_sdp(x:integer) return integer is
    type t_sdp is range 0 to 31; constant C_BASE:t_sdp:=10; variable v:t_sdp;
  begin v:=C_BASE+t_sdp(x); return integer(v); end function;
begin
  r<=f_sdp(5);end architecture bh;
