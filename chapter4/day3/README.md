### Day 3

1. Why did we add a Collection to this contract? List the two main reasons.

We added a Collection to this contract so that we would be able
to store all our NFTs at a single storage path, and so that other
users would be able to deposit NFTs into our account.

2. What do you have to do if you have resources "nested" inside of another resource? ("Nested resources")

You have to define a `destroy` function that will get called when
the outer resource is destroyed, so that the nested inner
resources are destroyed at the same time.  The outer resource
cannot be destroyed if it contains nested inner resources.

3. Brainstorm some extra things we may want to add to this contract. Think about what might be problematic with this contract and how we could fix it.

    - Idea #1: Do we really want everyone to be able to mint an NFT? 🤔.

        It seems like we would want to have some kind of
        restriction on who could mint NFTs.  We could restrict the
        createNFT function by setting the scope to `access(account)`.

    - Idea #2: If we want to read information about our NFTs inside our Collection, right now we have to take it out of the Collection to do so. Is this good?

        It takes more work to move the NFT in and out of our
        collection to look at it.  We could use a reference instead of
        moving the NFT itself.
