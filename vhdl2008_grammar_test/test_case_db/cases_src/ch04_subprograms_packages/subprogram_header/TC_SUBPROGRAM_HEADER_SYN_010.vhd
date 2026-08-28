-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: function with multiple parameters of generic (integer+boolean) in subprogram_header: function f generic(W:integer; EN:boolean) — verifies the comma-separated syntax of multiple generics in subprogram_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_multi_ent is port(v:in bit_vector(3 downto 0); r:out integer); end entity;
architecture bh of sh_multi_ent is
  function f_sum generic(W:integer) parameter(x:bit_vector(W-1 downto 0)) return integer is
    variable s:integer:=0;
  begin
    for i in x'range loop if x(i)='1' then s:=s+1; end if; end loop;
    return s;
  end function;
  function f_sum4 is new f_sum generic map(W=>4);
begin
  r<=f_sum4(x=>v);
end architecture bh;
