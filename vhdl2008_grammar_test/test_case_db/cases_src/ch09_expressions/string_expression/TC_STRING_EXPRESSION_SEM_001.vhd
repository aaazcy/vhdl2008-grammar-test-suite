-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_STRING_EXPRESSION_CHAR_ARRAY
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Rule Description: The type string is a one-dimensional array of character. String expressions must evaluate to the string type or a compatible array-of-character type.
-- Test Focus: SEM: string is a character array — indexing, slicing and concatenation operations are performed on a string type signal, verifying the standard operations of string as an array of character
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_sem_001 is
  port (
    a, b : in  string(1 to 4);
    y    : out string(1 to 9)
  );
end entity ent_str_sem_001;

architecture char_array of ent_str_sem_001 is
begin
  y <= a(1 to 2) & " " & b(1 to 2) & " " & a(3 to 4);
end architecture char_array;
