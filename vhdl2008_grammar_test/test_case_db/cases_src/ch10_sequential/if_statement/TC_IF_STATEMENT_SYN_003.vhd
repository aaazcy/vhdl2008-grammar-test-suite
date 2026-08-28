-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: nested if: outer if (sel=0~3) contains an if-elsif-else chain, each then body contains an inner if-then-else (checking val parity), verifies if_statement can nest another complete if_statement in its own body — labels of the two if levels are independent
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_nest_ent is port(sel:in integer range 0 to 3; val:in integer; y:out integer); end entity;
architecture bh of if_nest_ent is
begin
  process(sel,val) begin
    if sel=0 then
      if val mod 2=0 then y<=val; else y<=val+1; end if;
    elsif sel=1 then
      if val>100 then y<=100; else y<=val; end if;
    else
      y<=0;
    end if;
  end process;
end architecture bh;
