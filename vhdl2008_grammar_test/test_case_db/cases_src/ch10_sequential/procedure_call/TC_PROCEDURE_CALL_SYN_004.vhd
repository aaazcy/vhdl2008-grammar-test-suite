-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: parameterless call: `initialize;` — calling a procedure with no formal parameters, verifying that procedure_call may have no actual_parameter_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_call_noparam_ent is
  port (
    reset : in  bit;
    done  : out boolean
  );
end entity proc_call_noparam_ent;

architecture no_param of proc_call_noparam_ent is
  signal s_state : integer range 0 to 3 := 0;
begin
  process(reset) is
    procedure initialize is
    begin
      s_state <= 0;
    end procedure;
  begin
    if reset = '1' then
      initialize;  -- no parameters
    end if;
    done <= (s_state = 0);
  end process;
end architecture no_param;
