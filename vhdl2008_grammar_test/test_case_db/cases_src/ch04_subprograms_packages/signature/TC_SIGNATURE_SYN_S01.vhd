-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.3.3
-- Test Focus: Signature: [ [type_mark {,type_mark}] return type_mark ] — param+return, return-only, param-only, empty
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_signature_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_signature_syn_s01 is
  function f_sf(x:integer;y:bit) return boolean is begin return x>0 and y='1'; end function;
  function f_sr return integer is begin return 42; end function;
  attribute sa:string;
  attribute sa of f_sf[integer,bit return boolean]:function is "full_sig";
  attribute sa of f_sr[return integer]:function is "return_only";
begin
  r<=f_sr;end architecture bh;
