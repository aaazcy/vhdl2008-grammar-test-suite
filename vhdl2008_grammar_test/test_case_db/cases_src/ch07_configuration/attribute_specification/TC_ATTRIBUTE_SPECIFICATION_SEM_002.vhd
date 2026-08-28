-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive (Semantic)
-- Test Focus: Overloaded function disambiguation via attribute signature — verifies that attribute specification with a full function signature correctly distinguishes between two overloaded functions (integer vs bit_vector parameter), attaching the attribute to exactly one overload
-- Expected Result: Compiles successfully; attribute correctly targets the signature-matched overload
-- Dependencies: None
-- =============================================================
entity as_sem_overload_ent is
  port(a : in integer; y : out integer);
end entity;

architecture bh of as_sem_overload_ent is
  attribute pipeline : integer;
  function f_dbl(x : integer) return integer is
  begin return x * 2; end function;
  function f_dbl(x : bit_vector(3 downto 0)) return integer is
    variable r : integer := 0;
  begin
    for i in 0 to 3 loop if x(i)='1' then r:=r+2**i; end if; end loop;
    return r * 2;
  end function;
  attribute pipeline of f_dbl[integer return integer] : function is 3;
  signal s_val : integer := 0;
begin
  s_val <= a;
  y <= f_dbl(s_val);
end architecture bh;
