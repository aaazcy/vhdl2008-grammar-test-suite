-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_ENTITY_S_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic entity_specification with function signature — verifies that entity_specification with function entity_class and signature correctly identifies a specific overloaded function for attribute attachment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity espec_sem_func is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of espec_sem_func is
  attribute optimize : string;
  function f_and(x,y:bit) return bit is begin return x and y; end function;
  function f_or(x,y:bit) return bit is begin return x or y; end function;
  attribute optimize of f_and[bit,bit return bit] : function is "inline";
  signal s_a, s_b : bit := '0';
begin
  s_a <= a; s_b <= b;
  y <= f_and(f_or(s_a, s_b), s_b);
end architecture bh;
