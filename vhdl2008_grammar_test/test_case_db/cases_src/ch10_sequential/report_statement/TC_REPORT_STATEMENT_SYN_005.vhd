-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: complex string expression: the report message is built from string concatenation + a function call to form a dynamic message, verifying that expression may be any expression returning STRING
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_complex_ent is
  port (
    temp    : in  integer range -40 to 125;
    warning : out boolean
  );
end entity report_complex_ent;

architecture sensor of report_complex_ent is
  function temp_status(t : integer) return string is
  begin
    if t < 0 then return "FREEZING"; end if;
    if t > 100 then return "OVERHEAT"; end if;
    return "NORMAL";
  end function;
begin
  process(temp) is
  begin
    report "Temperature: " & integer'image(temp)
      & "C (" & temp_status(temp) & ")"
      severity note;
    warning <= (temp < 0) or (temp > 100);
  end process;
end architecture sensor;
