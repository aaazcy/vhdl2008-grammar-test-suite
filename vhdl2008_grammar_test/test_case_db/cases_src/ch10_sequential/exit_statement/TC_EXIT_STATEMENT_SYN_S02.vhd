-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: exit in a for loop - using exit to terminate early in a for-generate style iteration, verifying exit works within a for loop range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_for_loop_ent is
  port (
    prime_candidate : in  integer range 2 to 100;
    is_prime        : out boolean
  );
end entity exit_for_loop_ent;

architecture math of exit_for_loop_ent is
begin
  process(prime_candidate) is
    variable v_divisor : integer range 2 to 100;
    variable v_result  : boolean := true;
  begin
    v_result := true;
    test_loop: for v_divisor in 2 to prime_candidate / 2 loop
      if prime_candidate mod v_divisor = 0 then
        v_result := false;
        exit test_loop;
      end if;
    end loop test_loop;
    is_prime <= v_result;
  end process;
end architecture math;
