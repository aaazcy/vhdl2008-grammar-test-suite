-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Multiple statements including a loop: variable initialization -> for-loop accumulation -> signal assignment output, verifying loop as a single sequential_statement in a seq
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn5_ent is port(din:in integer; y:out integer); end entity;
architecture bh of sos_syn5_ent is
begin
  process(din) is
    variable v_acc : integer := 0;
  begin
    v_acc := 0;
    for i in 0 to 7 loop
      v_acc := v_acc + din;
    end loop;
    y <= v_acc;
  end process;
end architecture bh;
