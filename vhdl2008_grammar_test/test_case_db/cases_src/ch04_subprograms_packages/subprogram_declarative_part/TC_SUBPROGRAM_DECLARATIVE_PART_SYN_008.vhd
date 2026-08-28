-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: procedure declarative_part with type+variable and while loop used in body - full verification of the connection between declaration region and statement region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_proc_ent is port(clk:in bit; cnt:out integer); end entity;
architecture bh of sdp_proc_ent is
  procedure p_count(signal c:out integer) is
    variable v:integer:=0;
  begin
    v:=v+1;
    c<=v;
  end procedure;
  signal s_ctr:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then p_count(s_ctr); end if;
  end process;
  cnt<=s_ctr;
end architecture bh;
