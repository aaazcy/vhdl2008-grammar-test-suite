-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: mixed association call: `calc(p1, p2 => val);` — mixed usage where the first parameter is positional and the second parameter is named
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_call_mixed_ent is
  port (
    src  : in  integer range 0 to 255;
    gain : in  integer range 1 to 8;
    out_v: out integer range 0 to 2047
  );
end entity proc_call_mixed_ent;

architecture mixed of proc_call_mixed_ent is
  procedure amplify(
    input  : in  integer range 0 to 255;
    factor : in  integer range 1 to 8;
    signal output : out integer range 0 to 2047
  ) is
  begin
    output <= input * factor;
  end procedure;
begin
  process(src, gain) is
  begin
    amplify(src, factor => gain, output => out_v);  -- mixed: positional + named
  end process;
end architecture mixed;
