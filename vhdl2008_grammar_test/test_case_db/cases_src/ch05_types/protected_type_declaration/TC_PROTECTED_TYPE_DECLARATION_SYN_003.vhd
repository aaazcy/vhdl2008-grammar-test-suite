-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: Declaration with optional trailing simple name
--   matching the type identifier. Tests the full optional-
--   name syntax on the declaration side.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_named is
  port (
    go   : in  bit;
    data : out bit_vector(3 downto 0)
  );
end entity pt_decl_named;

architecture rtl of pt_decl_named is
  subtype t_nibble is bit_vector(3 downto 0);
  type t_nibbler is protected
    procedure load(d : bit_vector(3 downto 0));
    impure function output return t_nibble;
  end protected t_nibbler;
  type t_nibbler is protected body
    variable v_nib : bit_vector(3 downto 0) := "0000";
    procedure load(d : bit_vector(3 downto 0)) is begin v_nib := d; end procedure;
    impure function output return t_nibble is begin return v_nib; end function;
  end protected body t_nibbler;
  shared variable sv : t_nibbler;
begin
  process(go)
  begin
    if go'event and go = '1' then
      sv.load("1010");
      data <= sv.output;
    end if;
  end process;
end architecture rtl;
