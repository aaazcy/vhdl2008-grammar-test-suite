-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive
-- Test Focus: multiple parameters without label: `pwm_set(duty => 75, period => 100);` — a procedure_call with multiple named parameters used as a statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_stmt_multiparam_ent is
  port (
    duty_in   : in  integer range 0 to 100;
    period_in : in  integer range 1 to 1000;
    active    : out boolean
  );
end entity proc_stmt_multiparam_ent;

architecture pwm of proc_stmt_multiparam_ent is
  signal s_active : boolean := false;
begin
  process(duty_in, period_in) is
    procedure configure_pwm(
      duty   : in integer range 0 to 100;
      period : in integer range 1 to 1000
    ) is
    begin
      s_active <= (duty > 0);
    end procedure;
  begin
    configure_pwm(duty => duty_in, period => period_in);
  end process;
  active <= s_active;
end architecture pwm;
