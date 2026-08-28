-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: Alternative containing if/loop: when 1 => body contains an if-statement + a for-loop - verifying the alternative body can contain nested sequential control structures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn7_ent is port(sel:in integer range 0 to 2; din:in integer; y:out integer); end entity;
architecture bh of csa_syn7_ent is
begin
  process(sel,din) is
    variable v : integer := 0;
  begin
    case sel is
      when 0 =>
        y <= din;
      when 1 =>
        if din > 0 then
          y <= din * 2;
        else
          y <= 0;
        end if;
      when 2 =>
        v := 0;
        for i in 0 to 7 loop
          v := v + din;
        end loop;
        y <= v;
    end case;
  end process;
end architecture bh;
