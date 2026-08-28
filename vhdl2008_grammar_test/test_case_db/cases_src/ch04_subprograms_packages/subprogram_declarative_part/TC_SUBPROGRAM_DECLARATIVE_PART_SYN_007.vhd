-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part with alias + variable combination: alias followed by variable in function declaration region, verification of mixed declarative items of non-type declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_alias_ent is port(inp:in bit_vector(3 downto 0); outv:out integer); end entity;
architecture bh of sdp_alias_ent is
  function f_highest_bit(v:bit_vector(3 downto 0)) return integer is
    alias a_v : bit_vector is v;
    variable idx:integer:=-1;
  begin
    for i in a_v'range loop if a_v(i)='1' then idx:=i; end if; end loop;
    return idx;
  end function;
begin
  outv<=f_highest_bit(inp);
end architecture bh;
