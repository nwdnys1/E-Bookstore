package org.example.backend.serviceImpl;

import org.example.backend.repository.TagRepository;
import org.example.backend.service.TagService;

public class TagServiceImpl implements TagService {
    TagRepository repository;
    public TagServiceImpl(TagRepository repository) {
        this.repository = repository;
    }
}
