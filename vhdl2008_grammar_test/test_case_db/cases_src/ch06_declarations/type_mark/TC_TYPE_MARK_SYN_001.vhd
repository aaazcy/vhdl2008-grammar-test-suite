-- =============================================================
-- Case ID: TC_TYPE_MARK_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_mark ::= type_name | subtype_name
-- Case Type: Positive
-- Test Focus: Type mark referencing type+subtype: type_name and subtype_name used as type references in signal/constant/variable/function return/port declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tm_ent is port(a:in integer; y:out integer); end entity;
architecture bh of tm_ent is
  type t_data is range 0 to 1023;
  subtype t_byte is t_data range 0 to 255;
  signal s1:t_data:=0; signal s2:t_byte:=128;
  function f(x:t_data) return t_byte is begin return t_byte(x); end function;
begin s1<=t_data(a); y<=integer(f(s1)); end architecture bh;
