-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Positive
-- Test Focus: labeled concurrent procedure call — `check_timing(clk, data)` is preceded by the label `chk_proc :`, verifying the syntax of a labeled concurrent procedure call
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cpc_label_ent is
  port(clk, data : in bit; valid : out bit);
end entity cpc_label_ent;
architecture bh of cpc_label_ent is
  procedure check_timing(signal c, d : in bit) is
  begin
    if c'event and c = '1' then
      report "clock edge with data=" & bit'image(d);
    end if;
  end procedure check_timing;
begin
  chk_proc : check_timing(clk, data);
  valid <= data;
end architecture bh;
